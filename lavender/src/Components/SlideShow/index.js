import React, { useEffect, useState } from "react";
import "./style.css";
import * as detailProductApi from "../apis/detailProduct";
import * as imageApi from "../apis/image";
import { withRouter } from "react-router-dom";

function Index(props) {
  const [slideIndex, setSlideIndex] = useState(0);
  const [mausac, setMausac] = useState();

  const nextSlides = () => {
    var n = slideIndex + 1;
    var mausaclength = 0;
    if (mausac !== undefined) {
      mausaclength = mausac.length;
    }
    if (n === props.sohinhanh + mausaclength) n = 0;
    setSlideIndex(n);
  };
  const preSlides = () => {
    var n = slideIndex - 1;
    var mausaclength = 0;
    if (mausac !== undefined) {
      mausaclength = mausac.length;
    }
    if (n === -1) n = props.sohinhanh + mausaclength - 1;
    setSlideIndex(n);
  };
  const click = (n) => {
    setSlideIndex(n);
  };
  useEffect(() => {
    console.log("a");
    var { loai } = props.match.params;
    var { hang } = props.match.params;
    var { dong } = props.match.params;
    var { sanpham } = props.match.params;
    var query;
    query = `/${loai}/${hang}/${dong}/${sanpham}/mausac`;
    detailProductApi
      .mausac(query)
      .then((success) => {
        if (success.status === 200) {
          setMausac(success.data.value.$values);
          // console.log(success.data.value.$values);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }, [props.match]);
  return (
    <div className="box">
      {(function () {
        var result = [];
        for (var i = 0; i < props.sohinhanh; i++) {
          result.push(
            <div
              className={
                i === slideIndex
                  ? "product-img fade show"
                  : "product-img fade hidden"
              }
            >
              <img
                className="main-img box-shadow pink-shadow"
                alt=""
                src={imageApi.image(props.product.image, i)}
              />

              <a href={() => false} className="prev" onClick={preSlides}>
                ❮
              </a>
              <a href={() => false} className="next" onClick={nextSlides}>
                ❯
              </a>
            </div>
          );
        }

        if (mausac !== undefined) {
          for (var j = 0; j < mausac.length; j++) {
            result.push(
              <div
                className={
                  props.sohinhanh + j === slideIndex
                    ? "product-img fade show"
                    : "product-img fade hidden"
                }
              >
                <img
                  className="main-img box-shadow pink-shadow"
                  alt=""
                  src={imageApi.image(mausac[j].image)}
                />

                <a href={() => false} className="prev" onClick={preSlides}>
                  ❮
                </a>
                <a href={() => false} className="next" onClick={nextSlides}>
                  ❯
                </a>
              </div>
            );
          }
        }
        return result;
      })()}

      {/* Image text */}
      <div className="caption-box" alt="">
        <p id="caption" alt="" />
      </div>
      {/* The dots/circles */}
      <div style={{ textAlign: "center" }}>
        {(function () {
          // body
          var result = [];
          for (var i = 0; i < props.sohinhanh; i++) {
            if (i === slideIndex) {
              result.push(<span className="dot dotactive" />);
            } else result.push(<span className="dot" />);
          }

          if (mausac !== undefined) {
            for (var j = 0; j < mausac.length; j++) {
              if (props.sohinhanh + j === slideIndex) {
                result.push(<span className="dot dotactive" />);
              } else result.push(<span className="dot" />);
            }
          }
          return result;
        })()}
      </div>
      {/* Thumbnail images */}
      <div className="row">
        {(function () {
          var result = [];
          for (var i = 0; i < props.sohinhanh; i++) {
            let index = i;
            if (i === slideIndex) {
              result.push(
                <div className="mini-image">
                  <img
                    className="image-format mini-active"
                    src={imageApi.image(props.product.image, i)}
                    style={{ width: "100%" }}
                    alt=""
                  />
                </div>
              );
            } else
              result.push(
                <div className="mini-image">
                  <img
                    className="image-format demo cursor mini-inactive"
                    src={imageApi.image(props.product.image, i)}
                    style={{ width: "100%" }}
                    alt=""
                    onClick={() => click(index)}
                  />
                </div>
              );
          }

          if (mausac !== undefined) {
            for (var j = 0; j < mausac.length; j++) {
              let index = j;
              if (props.sohinhanh + j === slideIndex) {
                result.push(
                  <div className="mini-image">
                    <img
                      className="image-format mini-active"
                      src={imageApi.image(mausac[j].image)}
                      style={{ width: "100%" }}
                      alt=""
                    />
                  </div>
                );
              } else
                result.push(
                  <div className="mini-image">
                    <img
                      className="image-format demo cursor mini-inactive"
                      src={imageApi.image(mausac[j].image)}
                      style={{ width: "100%" }}
                      alt=""
                      onClick={() => click(index + props.sohinhanh)}
                    />
                  </div>
                );
            }
          }
          return result;
        })()}
      </div>
    </div>
  );
}

export default withRouter(Index);
