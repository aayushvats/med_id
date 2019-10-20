import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
reader = SimpleMFRC522()
dict = { }
try:    
        uname = input('username:')
        passwd = input('password:')
        print("Now place your tag to write")
        reader.write(uname)
        reader.write(passwd)    
        print("Written")
finally:
        GPIO.cleanup()

