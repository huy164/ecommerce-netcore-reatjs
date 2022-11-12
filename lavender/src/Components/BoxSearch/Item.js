import React from "react";
import * as imageApi from "../apis/image";
import { Link } from "react-router-dom";
import * as numberHelper from "../../Common/helper/numberHelper";

export default function Item(props) {
  return (
    <li className="odd first last">
      <Link to={props.product.image}>
        <div className="box-img">
          <img alt="anhthunho" src={imageApi.image(props.product.image)} />
        </div>
        <div className="box-info">
          <div className="box-name">
            <p>{props.product.tensanpham}</p>
          </div>
          <div className="box-price">
            <p className="old-price">
              {numberHelper.numberWithCommas(props.product.dongia)}₫ 
            </p>
            <p className="special-price">
              {props.product.giamoi==0?'Hết hàng': numberHelper.numberWithCommas(props.product.giamoi)}&nbsp;₫
            </p>
          </div>
        </div>
      </Link>
    </li>
  );
}
