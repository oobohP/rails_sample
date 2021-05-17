import React, { useState, useEffect } from "react";
import axios from "axios";
import Headline from "./Headline";
import GetHeadlines from "./GetHeadlines";

const App = () => {
  const [headlines, setHeadlines] = useState([]);

  // optionally can move into async await, before application scales. Need to include helper method if so
  // e.g const getHeadlines = async () => {}, then include inside useEffect
  useEffect(() => {
    axios
      .get("/api/v1/headlines")
      .then((response) => {
        setHeadlines(
          response.data.sort(
            (a, b) => b.published_date.localeCompare(a.published_date) // if in future needed to implement inverse as a dropdown -> input.sort((a, b) => a.timestamp.localeCompare(b.timestamp));
          )
        );
      })
      .catch((response) => console.log(response));
  }, [headlines.length]);

  return (
    <div className="ui container">
      <h1 className="ui header">RSS Headline Feed</h1>
      <GetHeadlines setHeadlines={setHeadlines} />

      <div className="ui divider"></div>
      <Headline headlines={headlines} />
    </div>
  );
};

export default App;
