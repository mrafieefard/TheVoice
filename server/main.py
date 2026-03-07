#!/usr/bin/env python3
"""
Main entry point for The Voice UDP Server
"""
import asyncio
import sys
import argparse
from voice_server import voice_server


def parse_arguments():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(description="The Voice UDP Server")
    parser.add_argument(
        "--host",
        type=str,
        default="0.0.0.0",
        help="Host address to bind to (default: 0.0.0.0)",
    )
    parser.add_argument(
        "--port", type=int, default=8888, help="Port number to bind to (default: 8888)"
    )
    return parser.parse_args()


async def main():
    """Main application entry point"""
    args = parse_arguments()

    print(f"Starting The Voice UDP Server on {args.host}:{args.port}")
    print("Press Ctrl+C to stop the server")

    try:
        await voice_server(host=args.host, port=args.port)
    except KeyboardInterrupt:
        print("\nServer stopped by user")
    except Exception as e:
        print(f"Server error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    asyncio.run(main())
