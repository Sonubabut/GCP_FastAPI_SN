import React from "react";
import "./Home.css";

const HomePage = () => {
  return (
    <div className="home-page">
      <div className="home-animation">
        {/* Add your animation here */}
        <img
          src={"https://digitalt3.com/wp-content/uploads/2024/08/FastAI-logo.png"}
          alt="FastAI"
          className="logo"
          style={{ width: "440px" }}
        />
        <h1>FastAI</h1>
        <p>
          Answer general, related questions with Our GCP and SambaNova
          Powered FastAPI
        </p>
      </div>
    </div>
  );
};

export default HomePage;
