import React, { Component } from "react";
import * as productApi from "../../apis/product";
import * as detailProductapi from "../../apis/detailProduct";
import * as imageApi from "../../apis/image";
import { withRouter } from "react-router-dom";
import * as evalueteApi from "../../apis/evaluete";
import * as favoriteApi from "../../apis/favorite";

class SanphamItem extends Component {
  state = { sanpham: {}, giamoi: 0, sosao: 0, sodanhgia: 0 };
  async componentDidMount() {
    productApi
      .findProductById(this.props.masanpham)
      .then((success) => {
        if (success.status === 200) {
          this.setState({ sanpham: success.data.value });
        }
      })
      .catch((error) => {
        console.error(error);
      });

    detailProductapi
      .xemgiamoitheomasanpham(this.props.masanpham)
      .then((success) => {
        this.setState({ giamoi: success.data.value });
      })
      .catch((error) => {
        console.error(error);
      });
    evalueteApi
      .evalueteByProductId(this.props.masanpham)
      .then((success) => {
        if (success.status === 200) {
          this.setState({
            sosao: success.data.value.trungbinh,
            sodanhgia: success.data.value.sodanhgia,
          });
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }

  async deleteSanphamyeuthich() {
    favoriteApi.unlike(this.props.makhachhang,this.props.masanpham )
    .then((success) => {
      if (success.status===200) {
        this.props.deleteYeuthich();
      }
    })
    .catch((error) => {
      console.error(error);
    })
  }

  render() {
    return (
      <li className="item border rounded">
        <button
          className="btn-delete"
          onClick={this.deleteSanphamyeuthich.bind(this)}
        >
          ×
        </button>
        <div className="thumbnail">
          <div to={this.state.sanpham.image}>
            <div className="Picture__StyledPicture-sc-10icj7e-0 jDowEZ loaded">
              <img
                alt="anhsanpham"
                className="image"
                src={
                  this.state.sanpham !== undefined &&
                  imageApi.image(this.state.sanpham.image)
                }
              />
            </div>
          </div>
        </div>
        <div className="body">
          <div className="name">{this.state.sanpham.tensanpham}</div>
          <div className="rating">
            <div className="rating__base">
              <i
                className={
                  this.state.sosao < 1 ? "fas fa-star" : "fas fa-star checked"
                }
              />
              <i
                className={
                  this.state.sosao < 2 ? "fas fa-star" : "fas fa-star checked"
                }
              />
              <i
                className={
                  this.state.sosao < 3 ? "fas fa-star" : "fas fa-star checked"
                }
              />
              <i
                className={
                  this.state.sosao < 4 ? "fas fa-star" : "fas fa-star checked"
                }
              />
              <i
                className={
                  this.state.sosao < 5 ? "fas fa-star" : "fas fa-star checked"
                }
              />
            </div>
          </div>
          <span className="review-count">
            ({this.state.sodanhgia} nhận xét)
          </span>
          <div className="description" />
        </div>
        <div className="footer">
          <div className="price has-discount">{this.state.giamoi}</div>
          <div className="wrap">
            {(() => {
              if (this.state.sanpham.dongia !== this.state.giamoi)
                return (
                  <div className="list-price">{this.state.sanpham.dongia}</div>
                );
            })()}
            {(() => {
              if (this.state.sanpham.dongia !== this.state.giamoi)
                return (
                  <div className="discount">
                    -
                    {(
                      100 -
                      (this.state.giamoi / this.state.sanpham.dongia) * 100
                    ).toFixed(0)}
                    %
                  </div>
                );
            })()}
          </div>
        </div>
      </li>
    );
  }
}

export default withRouter(SanphamItem);
