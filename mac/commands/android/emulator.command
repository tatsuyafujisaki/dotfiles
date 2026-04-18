# Using "&|" instead of "&" keeps the emulator running even after you close Terminal.

emulator -avd $(emulator -list-avds | tail -1)
