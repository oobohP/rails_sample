import axios from "axios";
import React from "react";

const GetHeadlines = (props) => {
  const createHeadline = async () => {
    const { data } = await axios.post("/api/v1/headlines").catch((err) => {
      console.log(err);
    });
    props.setHeadlines((arr) => [...arr, `${arr.length}`]);
    console.log(data);
  };

  return (
    <div>
      <button className="ui button" onClick={() => createHeadline()}>
        Get Latest Headline
      </button>
    </div>
  );
};

export default GetHeadlines;
