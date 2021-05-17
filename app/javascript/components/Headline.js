import React from "react";

const Headline = (props) => {
  const list = props.headlines.map((item) => {
    // console.log(moment.format(item.published_date));
    return (
      <a
        key={item.id}
        className="item"
        href={item.article_source}
        target="_blank">
        <p className="header">{item.title}</p>
        <div className="description">{item.published_date}</div>
      </a>
    );
  });

  return (
    <div>
      <h3 className="ui header">The Verge</h3>
      <ul className="ui relaxed animated list">{list}</ul>
    </div>
  );
};

export default Headline;
