import asyncio
import socket
import time


async def test_client():
    """Simple UDP client to test the voice server"""

    # Create UDP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_address = ("localhost", 8888)

    try:
        print("Testing UDP Voice Server...")

        # Test 1: Ping
        print("\n1. Testing PING...")
        sock.sendto(b"PING", server_address)
        response, _ = sock.recvfrom(1024)
        print(f"Response: {response.decode('utf-8')}")

        # Test 2: Send voice data
        print("\n2. Testing VOICE_DATA...")
        voice_data = b"VOICE_DATA:" + b"fake_audio_data_" * 10
        sock.sendto(voice_data, server_address)
        response, _ = sock.recvfrom(1024)
        print(f"Response: {response.decode('utf-8')}")

        # Test 3: Unknown command
        print("\n3. Testing unknown command...")
        sock.sendto(b"UNKNOWN_CMD", server_address)
        response, _ = sock.recvfrom(1024)
        print(f"Response: {response.decode('utf-8')}")

        # Test 4: Disconnect
        print("\n4. Testing DISCONNECT...")
        sock.sendto(b"DISCONNECT", server_address)
        response, _ = sock.recvfrom(1024)
        print(f"Response: {response.decode('utf-8')}")

        print("\nClient tests completed!")

    except Exception as e:
        print(f"Client error: {e}")
    finally:
        sock.close()


if __name__ == "__main__":
    asyncio.run(test_client())
