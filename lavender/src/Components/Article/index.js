import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import * as articleApi from "../apis/article";
import LoadingContainer from "../../Common/helper/loading/LoadingContainer";
import { stubTrue } from "lodash";
import { CLIENT_ENDPOINT } from "../../Common/constants";
function Article() {
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(stubTrue);
  useEffect(() => {
    (async () => {
      await articleApi
        .allArticle()
        .then((res) => {
          console.log(res);
          setPosts(res.data);
        })
        .catch((err) => {
          console.log(err);
        });
      setLoading(false);
    })();
  }, []);
  return (
    <div>
      <LoadingContainer loading={loading}></LoadingContainer>
   
        <section>
      
          <div id="wrapper">
            <div className="container">
              <div className="row">
                <div className="col-9">
                  <div className="page-wrapper">
                    <div className="blog-top clearfix mb-3">
                      <Link to="/addArticle"  className="btn btn-success">đăng bài viết</Link>
                      <h3 className="pull-left">Tin công nghệ</h3>
                    </div>
                    {posts.map((post) => (
                      <div className="blog-box  pb-2 ">
                        <Link  onClick={() => { window.location.href = `${CLIENT_ENDPOINT}/articledetail/${post.mabaiviet}` }}>
                          <div>
                            <div className=" row mb-4">
                              <div className="col-md-4">
                                <div className="post-media">
                                  <img
                                    src={post.thumnail}
                                    alt=""
                                    className="img-fluid"
                                  />
                                  <div className="hovereffect" />
                                </div>
                              </div>
                              <div className="blog-meta big-meta col-8">
                                <h5>
                                  {post.tieude}
                                </h5>
                                <p>{post.mota}</p>
                              </div>
                            </div>
                          </div>
                        </Link>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
  
        </section>
     
    </div>
  );
}

export default Article;
