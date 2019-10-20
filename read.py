import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522()

try:
        passwd, uname = reader.read()
        print(passwd)
        print(uname)
finally:
        GPIO.cleanup()
