import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import * as articleApi from "../../apis/article";
import LoadingContainer from "../../../Common/helper/loading/LoadingContainer";
import { stubTrue } from "lodash";
import { CLIENT_ENDPOINT } from "../../../Common/constants/index";
import * as myToast from "../../../Common/helper/toastHelper";
import _ from "lodash";

function ArticleDashboard() {
  const [posts, setPosts] = useState([]);
  const [verified, setVerified] = useState("duyệt");
  const [denied, setDenied] = useState("hủy yêu cầu");
  const [loading, setLoading] = useState(stubTrue);
  useEffect(() => {
    (async () => {
      await articleApi
        .allArticlePending()
        .then((res) => {
          console.log(res.data);
          // if(res.data.length > 0) {
          //     setIsEmpty(false);
          // }
          setPosts(res.data);
        })
        .catch((err) => {
          console.log(err);
        });
      setLoading(false);
    })();
  }, []);

  function verify(mabaiviet) {
    articleApi
      .vertifyArticle(mabaiviet)
      .then((success) => {
        if (success.status === 200) {
          myToast.toastSucces("Đã phê duyệt");

          var temp = posts;
          _.remove(temp, function (n) {
            return n.mabaiviet === mabaiviet;
          });

          setPosts([...temp]);
        }
      })
      .catch((error) => {
        console.error(error);
        myToast.toastError("Phê duyệt thất bại");
      });
  }

  function deny(mabaiviet) {
    articleApi
      .deleteArticle(mabaiviet)
      .then((res) => {
        if (res.status === 200) {
          setDenied("đã hủy");
          myToast.toastSucces("Đã huỷ");

          var temp = posts;
          _.remove(temp, function (n) {
            return n.mabaiviet === mabaiviet;
          });

          setPosts([...temp]);
        }
      })
      .catch((err) => {
        console.error(err);
        myToast.toastError("Huỷ thất bại");
      });
  }
  return (
    <div>
      <LoadingContainer loading={loading}></LoadingContainer>
    
        <div id="wrapper">
          <div className="container">
            <div className="row">
              <div className="col-lg-3"></div>
              <div className="col">
                <div className="page-wrapper">
                  <div className="blog-top clearfix mb-5">
                    <h3>Bài viết cần phê duyệt</h3>
                  </div>
                  {posts.map((post) => (
                    <div className="blog-box pt-3 pb-2 ">
                      <div>
                        <div className=" row mb-4">
                          <div className="col-md-4">
                            <div className="post-media">
                              <img
                                src={post.thumnail}
                                alt=""
                                className="img-fluid"
                              />
                            </div>
                          </div>
                          <div className="blog-meta big-meta col-8">
                            <h5>{post.tieude}</h5>
                            <p>{post.mota}</p>
                            <input
                              id={post.mabaiviet}
                              className="btn btn-success"
                              type="button"
                              onClick={() => verify(post.mabaiviet)}
                              value={verified}
                            />
                            <input
                              id={post.mabaiviet}
                              className="btn btn-primary"
                              type="button"
                              onClick={() => deny(post.mabaiviet)}
                              value={denied}
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
    
    </div>
  );
}

export default ArticleDashboard;
