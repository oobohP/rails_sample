import axios from "axios";
import React from "react";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

// Hits headlines_controller.rb and pulls latest rss feed and send to database
const GetHeadlines = (props) => {
  const createHeadline = async () => {
    const { data } = await axios.post("/api/v1/headlines").catch((err) => {
      console.log(err);
      toast.error("Latest Headline already exist, try again later");
    });
    props.setHeadlines((arr) => [...arr, `${arr.length}`]);
    toast.success("Headline added: " + data.title);
  };

  return (
    <div>
      <button className="ui button" onClick={() => createHeadline()}>
        Get Latest Headline
      </button>
      <ToastContainer position="top-center" />
    </div>
  );
};

export default GetHeadlines;
