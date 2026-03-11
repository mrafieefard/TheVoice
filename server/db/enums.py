from enum import Enum

class ChannelType(str, Enum):
    VOICE = "voice"
    TEXT = "text"