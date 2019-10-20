import flask
from flask import request, jsonify
import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
reader = SimpleMFRC522()
app = flask.Flask(__name__)
app.config["DEBUG"] = True
try:
    username = input('enter your username')
    print("bring the card near the scanner")
    reader.write(username)
    print("username written")
    @app.route('/', methods=['GET'])
    def home():
        return '''<h1>Distant Reading Archive</h1>
        <p>A prototype API for our project</p'''

    @app.route('/v1', methods=['GET'])
    def api_all():
           return jsonify(username)
 #  ch = input('do you want to enter more usernames(y/n)')
 #  if ch == 'n':
 #       break

 
finally:
    GPIO.cleanup()
app.run()

