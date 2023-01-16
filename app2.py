from flask import Flask, request, jsonify
import requests

app = Flask(__name__)


@app.route('/')
def index():
    return jsonify('App2')


@app.route('/ep', methods=['POST'])
def ep():
    data = {}

    res = requests.post('http://0.0.0.0:8004/ep', files=data)
    res = res.json()

    return jsonify(data)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8003, debug=True)