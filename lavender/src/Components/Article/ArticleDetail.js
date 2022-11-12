import React, {  useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import "./addArticle.css";
import "./style.css";
import Article from "./index.js";
import * as articleApi from "../apis/article";

function ArticleDetail() {
    const mabaiviet = useParams().mabaiviet;
    console.log(mabaiviet);
    const [posts, setPosts] = useState([]);
    useEffect(() => {
        articleApi.getArticle(mabaiviet)
            .then(res => {
                console.log(res);
                setPosts(res.data);
            })
            .catch(err => {
                console.log(err)
            })
    }, [mabaiviet])

    return (
        <div className="container">
            <div className="row">
                <div className="article-detail px-10 pt-7 bg-white text-black  article-detail ">
                    {
                        posts.map(post => (
                            <div>
                            <div dangerouslySetInnerHTML={{ __html: post.noidung }} />
                            {/* <Comment link={window.location.href}></Comment> */}
                            <div class="fb-comments" data-href={window.location.href} data-width="100%" data-numposts="5"></div> 
                            </div>
                        ))
                    }
                </div>
                <Article></Article>
            </div>
        </div>
    );
}

export default ArticleDetail;
