from flask import Flask, render_template, request
from flask.json import jsonify
import queries

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/election/<int:year>')
def election(year):
    data = [('OH', '#0000FF')]
    return render_template('election.html', year=year, data=data)

@app.route('/county-stats', methods=['GET'])
def county_stats():
    if request.args.get('year') is not None:
        data = (('Candidate1', 2131), (request.args.get('county'), 1234))
        return render_template('county-stats.html', test='qerty', states=queries.states(), state=request.args.get('state'), county=request.args.get('county'), data=data)
    return render_template('county-stats.html', states=queries.states())

@app.route('/county-trends')
def county_trends():
    if request.args.get('county') is not None:
        data = ((2000, 123, 456), (2004, 543, 234))
        return render_template('county-trends.html', states=queries.states(), state=request.args.get('state'), county=request.args.get('county'), data=data)
    return render_template('county-trends.html', states=queries.states())

@app.route('/participation/<int:year>')
def participation(year):
    data = (('Ohio', 45.2), ('New York', 25.9433))
    return render_template('participation.html', year=year, data=data)

@app.route('/counties/<state>')
def counties(state):
    state1 = state + '1'
    state2 = state + '2'
    return jsonify(((state1), (state2)))

if __name__ == '__main__':
    app.run(debug=True)