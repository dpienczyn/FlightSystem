import React from "react";
import ReactDOM from "react-dom";
import PropTypes from "prop-types"

class ListFlights extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      loading: true,
      flights: this.props.flights,
      value: '',
      input: '',
      filteredFlights: this.props.flights,
      current_user: this.props.current_user
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleChangeA = this.handleChangeA.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleChangeA(e) {
    this.setState({input: e.target.value});
  }

  handleSubmit(event) {
    let newFlights = this.state.flights.filter((a) => {
      return(
        (this.state.value == '' || this.state.value == a.departure) &&
        (this.state.input == '' || this.state.input == a.arrival)
      )
    });

    this.setState({filteredFlights: newFlights});
    event.preventDefault();
  }

  render() {
    let that = this;

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input type="text" value={this.state.value} onChange={this.handleChange}/>
          <input type="text" value={this.state.input} onChange={this.handleChangeA}/>
          <input type="submit" value="Wyślij" />
        </form>
        <table>
          <thead>
            <tr>
              <th>departure_date</th>
              <th>time</th>
              <th>departure</th>
              <th>arrival</th>
              <th>flight_length</th>
              <th>number_of_seats</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {this.state.filteredFlights.map(function (item, i) {
              return(<tr key={i}>
                <td>{item.departure_date}</td>
                <td>{item.time}</td>
                <td>{item.departure}</td>
                <td>{item.arrival}</td>
                <td>{item.flight_length}</td>
                <td>{item.number_of_seats - item.reservations.length}</td>
                <td>{that.state.current_user && <a href={`/flights/${item.id}/reservations`}>Rezerwacja</a> }</td>
              </tr>);
            })}

          </tbody>
        </table>
      </div>
    )
  }
}

export default ListFlights;
