import React, { Component } from "react";
import * as imageApi from "../apis/image";
import * as productApi from "../apis/product";
import * as shipApi from "../apis/ship";
import * as customerApi from "../apis/customer";
import Cookies from "universal-cookie";

const cookie = new Cookies();

export default class BillItem extends Component {
  state = { product: undefined, customer: undefined, ship: undefined };
  async componentDidMount() {
    var task1 = () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      productApi
        .findProductByBillId(this.props.bill.sohoadon, token, refreshtoken)
        .then((success) => {
          if (success.status === 200) {
            this.setState({ product: success.data.value.$values });
          }
        })
        .catch((error) => {
          console.error(error);
        });
    };
    var task2 = () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      customerApi
        .findCustomerByBillId(this.props.bill.sohoadon, token, refreshtoken)
        .then((success) => {
          if (success.status === 200)
            this.setState({ customer: success.data.value });
        })
        .catch((error) => {
          console.error(error);
        });
    };
    var task3 = () => {
      var token = cookie.get("token");
      var refreshtoken = cookie.get("refreshtoken");
      shipApi
        .findShipByBillId(this.props.bill.sohoadon, token, refreshtoken)
        .then((success) => {
          if (success.status === 200)
            this.setState({ ship: success.data.value });
        })
        .catch((error) => {
          console.error(error);
        });
    };
    Promise.allSettled([task1(), task2(), task3()]);
  }
  render() {
    return (
      <>
        {this.state.product !== undefined && this.state.customer !== undefined && (
          <>
            <tr>
              <td>
                <div className="text-center avatar-group mt-2">
                  <h6 className="mb-0 text-sm">
                    {this.state.customer.sodienthoai}{" "}
                  </h6>
                </div>
              </td>
              <td className="align-middle text-center text-sm">
                <div className="avatar-group mt-2">
                  <h6 className="mb-0 text-sm">
                    {this.state.customer.tenkhachhang}{" "}
                  </h6>
                </div>
              </td>
              <td className="align-middle">
                <div className="avatar-group mt-2">
                  <h6 className="mb-0 text-sm">
                    {this.state.ship !== undefined
                      ? this.state.ship.trangthai
                      : "Không có thông tin"}{" "}
                  </h6>
                </div>
              </td>
            </tr>
            <tr >
              <td colspan="100" className="row text-center"  style={{maxWidth: "500px"}}>
                {this.state.product.map((value, key) => {
                  return (
                    <div className="d-flex px-5 py-1  "  key={key}>
                      <div>
                        <img
                          src={
                            value.image !== null && value.image !== undefined
                              ? imageApi.image(value.image)
                              : ""
                          }
                          className="avatar avatar-sm me-3"
                          alt="xd"
                        />
                      </div>
                      <div className="d-flex flex-column justify-content-center">
                        <h6 className="mb-0 text-sm">
                          {value.tenthuonghieu}{" "}
                          {value.tensanpham}
                        </h6>
                      </div>
                    </div>
                  );
                })}
              </td>
            </tr>
          </>
        )}
       
      </>
    );
  }
}
