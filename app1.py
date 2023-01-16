from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify('App1')

@app.route('/ep', methods = ['POST'])
def ep():

    data = {}

    # code for receiving data
    # processing data and saving results in dictionary

    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8004, debug=True)