import React, {useEffect, useState} from "react";
import "./ProductItem.css";
import * as imageApi from "../apis/image.js";
import * as detailProductapi from "../apis/detailProduct";
import * as evalueteApi from "../apis/evaluete";
import * as productApi from "../apis/product";
import { CLIENT_ENDPOINT } from "../../Common/constants";
import * as trademarkApi from "../apis/trademark";
import * as numberHelper from "../../Common/helper/numberHelper";
import { Link } from "react-router-dom";

export default function ProductItem (props) {

  const [sosao, setSosao] = useState(0);
  const [sodanhgia, setSodanhgia] = useState(0);
  const [thongsokithuat, setThongsokithuat] = useState([]);


  useEffect(() =>{
    evalueteApi
      .evalueteByProductId(props.product.masanpham)
      .then((success) => {
        if (success.status === 200) {
         setSosao(success.data.value.trungbinh)
            setSodanhgia(success.data.value.sodanhgia)
        }
      })
      .catch((error) => {
        console.error(error);
      });

    productApi
      .thongsokithuatBangMasanpham(props.product.masanpham)
      .then((success) => {
        setThongsokithuat(success.data.value.$values)
      })
      .catch((error) => {
        console.error(error);
      });

  },[props.product])
    return (
      <div className="product-item " data-aos="zoom-in" data-aos-delay={100}>
        <div className="icon-box iconbox-blue">
          <div className="row">
            {function () {
              if (props.product.giamoi === 0) return;
              if (props.product.giamoi  < props.product.dongia)
                return (
                  <div className="box-item-sticker-percent">
                    <p>
                      Giảm{""}
                      {(
                        100 -
                        (props.product.giamoi  / props.product.dongia) * 100
                      ).toFixed(0)}
                      %
                    </p>
                  </div>
                );
            }()}

            <Link
            to={props.product.image}
              // href={() => false}
              onClick={() => {
                var url = CLIENT_ENDPOINT + props.product.image;
                window.location.href = `${url}`;
              }}
              className="box-click"
            >
              <div className="icon">
                <img
                  alt=""
                  src={imageApi.image(props.product.image)}
                ></img>
                <i className="bx bxl-dribbble" />
              </div>
              <div>
                <h5 className="product-name text-dark">
                  {props.product.tensanpham}
                </h5>
              </div>
            </Link>
            <div className="row product-price">
              <div className="">
                {function () {
                  var result = [];
                  if (props.product.giamoi  !== props.product.dongia) {
                    result.push(
                      <p className="old-price">
                        {numberHelper.numberWithCommas(
                          props.product.dongia
                        )}
                        ₫
                      </p>
                    );
                  }
                  result.push(
                    <a href={() => false}>
                      {props.product.giamoi  === 0
                        ? "Hết hàng"
                        : numberHelper.numberWithCommas(props.product.giamoi) +
                          "₫"}{" "}
                    </a>
                  );
                  return result;
                }()}
              </div>
              <div className="item-product__box-raiting mt-4 ">
                <i
                  className={
                    sosao < 1 ? "fas fa-star" : "fas fa-star checked"
                  }
                />
                <i
                  className={
                    sosao < 2 ? "fas fa-star" : "fas fa-star checked"
                  }
                />
                <i
                  className={
                    sosao < 3 ? "fas fa-star" : "fas fa-star checked"
                  }
                />
                <i
                  className={
                    sosao < 4 ? "fas fa-star" : "fas fa-star checked"
                  }
                />
                <i
                  className={
                    sosao < 5 ? "fas fa-star" : "fas fa-star checked"
                  }
                />
                &nbsp;{sodanhgia} đánh giá
              </div>
            </div>
          </div>
        </div>
      </div>
    );
}
