import asyncio
import logging
import socket
from typing import Tuple, Optional
import wave
import os
from typing import Union

# Configure logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


def append_pcm_to_wav(path, pcm_data, sample_rate=16000, channels=1, sample_width=2):
    """
    Append raw PCM bytes to a WAV file.
    """

    existing_audio = b""

    if os.path.exists(path):
        with wave.open(path, "rb") as wf:
            if wf.getframerate() != sample_rate:
                raise ValueError("Sample rate mismatch")
            if wf.getnchannels() != channels:
                raise ValueError("Channel count mismatch")
            if wf.getsampwidth() != sample_width:
                raise ValueError("Sample width mismatch")

            existing_audio = wf.readframes(wf.getnframes())

    with wave.open(path, "wb") as wf:
        wf.setnchannels(channels)
        wf.setsampwidth(sample_width)
        wf.setframerate(sample_rate)

        wf.writeframes(existing_audio + pcm_data)


class VoiceServerProtocol(asyncio.DatagramProtocol):
    """UDP Protocol handler for voice server"""

    def __init__(self):
        self.transport = None
        self.clients = {}  # Track connected clients

    def connection_made(self, transport):
        """Called when the protocol is created"""
        self.transport = transport
        logger.info("Voice server started and ready to receive connections")

    def datagram_received(self, data: bytes, addr: Tuple[str, int]):
        """Handle incoming UDP datagram"""
        try:
            # Add client to tracking if new
            if addr not in self.clients:
                self.clients[addr] = {}
                logger.info(f"New client connected from {addr[0]}:{addr[1]}")

            # Process the voice data
            response = self.process_voice_data(data, addr)

            # Send response back to client
            if response:
                self.transport.sendto(response, addr)

        except Exception as e:
            logger.error(f"Error processing data from {addr}: {e}")
            # Send error response
            error_response = b"ERROR: " + str(e).encode("utf-8")
            self.transport.sendto(error_response, addr)

    def process_voice_data(self, data: bytes, addr: Tuple[str, int]) -> Optional[bytes]:
        """Process incoming voice data and return response"""
        try:
            # Log received data info
            logger.info(f"Received {len(data)} bytes from {addr[0]}:{addr[1]}")

            # Handle different message types
            if data.startswith(b"PING"):
                return b"PONG"
            elif data.startswith(b"VOICE_DATA:"):
                # Process voice data here
                voice_data = data[11:]  # Remove "VOICE_DATA:" prefix

                # Relay voice data to other clients immediately (no disk I/O)
                for client in self.clients:
                    if client != addr:
                        self.transport.sendto(b"VOICE_DATA:" + voice_data, client)
                return
            elif data.startswith(b"DISCONNECT"):
                # Handle client disconnect
                if addr in self.clients:
                    del self.clients[addr]
                    logger.info(f"Client {addr[0]}:{addr[1]} disconnected")
                return b"DISCONNECTED"
            else:
                # Unknown message type
                logger.warning(f"Unknown message type from {addr}: {data[:20]}")
                return b"UNKNOWN_MESSAGE_TYPE"

        except Exception as e:
            logger.error(f"Error in process_voice_data: {e}")
            return None

    def error_received(self, exc):
        """Handle protocol errors"""
        logger.error(f"Protocol error: {exc}")

    def connection_lost(self, exc):
        """Handle connection loss"""
        if exc:
            logger.error(f"Connection lost: {exc}")
        else:
            logger.info("Server stopped")


async def run_voice_server(host: str = "localhost", port: int = 8888):
    """
    Start and run the UDP voice server

    Args:
        host (str): Host address to bind to (default: "localhost")
        port (int): Port number to bind to (default: 8888)
    """
    try:
        # Get event loop
        loop = asyncio.get_running_loop()

        # Create UDP endpoint
        transport, protocol = await loop.create_datagram_endpoint(
            VoiceServerProtocol, local_addr=(host, port), family=socket.AF_INET
        )

        logger.info(f"Voice server started on {host}:{port}")
        logger.info("Server is ready to receive voice data...")
        logger.info("Supported commands: PING, VOICE_DATA:<data>, DISCONNECT")

        try:
            # Keep the server running
            await asyncio.Future()  # Run forever
        except KeyboardInterrupt:
            logger.info("Received interrupt signal, shutting down server...")
        finally:
            # Close the transport
            transport.close()
            logger.info("Server stopped")

    except Exception as e:
        logger.error(f"Failed to start server: {e}")
        raise


async def main():
    """Main entry point for testing"""
    try:
        await voice_server(host="192.168.0.122", port=8888)
    except KeyboardInterrupt:
        logger.info("Server interrupted by user")
    except Exception as e:
        logger.error(f"Server error: {e}")


if __name__ == "__main__":
    # Run the server
    asyncio.run(main())
