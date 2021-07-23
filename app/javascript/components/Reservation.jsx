import React, { useState, useEffect } from "react";
import ReactDOM from "react-dom";
import SeatPicker from "react-seat-picker";

class Reservation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true,
      flight: this.props.flight,
      reservations: this.props.reservations,
    };
  }

  addSeatCallback = ({ row, number, id }, addCb) => {
    this.setState(
      {
        loading: true,
      },
      async () => {
        const request = new Request(
          `/api/v1/flights/${this.state.flight.id}/reservations`,
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json, text/plain, */*",
            },
            body: JSON.stringify({
              reservation: { number: id },
            }),
          }
        );

        await fetch(request)
          .then((r) =>
            r.json().then((data) => ({ status: r.status, body: data }))
          )
          .then((response) => {
            if (response.status === 200) {
              this.state.reservations.push({ number: id });
              this.setState({
                reservations: this.state.reservations,
              });
            } else {
              console.log(response.body);
            }
          })
          .catch((error) => {
            console.error(error);
          });
        console.log(`Added seat ${number}, row ${row}, id ${id}`);
        const newTooltip = `tooltip for id-${id} added by callback`;
        addCb(row, number, id, newTooltip);
        this.setState({ loading: false });
      }
    );
  };

  removeSeatCallback = ({ row, number, id }, removeCb) => {
    this.setState(
      {
        loading: true,
      },
      async () => {
        console.log("to jest state");
        console.log(this.state.reservations);
        let reservation = this.state.reservations.find((e) => {
          return e.number == id;
        });

        const request2 = new Request(
          `/api/v1/flights/${this.state.flight.id}/reservations/${reservation.id}`,
          {
            method: "DELETE",
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json, text/plain, */*",
            },
            body: JSON.stringify({
              reservation: { number: id },
            }),
          }
        );

        await fetch(request2)
          .then((r) =>
            r.json().then((data2) => ({ status: r.status, body: data2 }))
          )
          .then((response2) => {
            if (response2.status === 200) {
            } else {
              console.log(response2.body);
            }
          })
          .catch((error) => {
            console.error(error);
          });

        const newTooltip = ["A", "B", "C"].includes(row) ? null : "";
        removeCb(row, number, newTooltip);
        this.setState({ loading: false });
      }
    );
  };

  async componentDidMount() {
    this.setState({ loading: false });
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    const a = Array(this.state.flight.number_of_seats)
      .fill()
      .map((_, a) => {
        return { id: a + 1, number: (a % 6) + 1, isReserved: false };
      });

    for (var idx in this.state.reservations) {
      let y = a.find((e) => {
        return e.id == this.state.reservations[idx].number;
      });
      y.isReserved = true;
    }

    const b = a.reduce((r, b) => {
      const section = Math.floor((b.id - 1) / 6);

      r[section] = [...(r[section] || []), b];
      return r;
    }, {});

    var array_values = new Array();

    for (var key in b) {
      array_values.push(b[key]);
    }

    const rows = array_values;

    const { loading } = this.state;
    return (
      <div>
        <h1>Seat Picker Continuous Case</h1>
        <div style={{ marginTop: "100px" }}>
          <SeatPicker
            addSeatCallback={this.addSeatCallback}
            removeSeatCallback={this.removeSeatCallback}
            rows={rows}
            maxReservableSeats={this.state.flight.number_of_seats}
            alpha
            visible
            selectedByDefault
            loading={loading}
            tooltipProps={{ multiline: true }}
          />
        </div>
      </div>
    );
  }
}

export default Reservation;
