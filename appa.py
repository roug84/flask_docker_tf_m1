"""
Flask running blueprints
"""
from flask import Flask
import os
from dotenv import load_dotenv
from views.index import bp as index_bp
from views.upload_file import bp10 as upload_file_bp

load_dotenv()
app = Flask(__name__)
name = os.getenv('NAME')

# Register BPs
app.register_blueprint(index_bp)
app.register_blueprint(upload_file_bp)

if __name__ == '__main__':
    # app.secret_key = os.urandom(12)
    #app.run(debug = True)
    app.run(host="0.0.0.0", port='8004')