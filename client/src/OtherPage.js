import React from 'react';
import { Link } from 'react-router-dom';

export default () => (
  <div>
    Some other page
    <Link to="/">
      Back to home page
    </Link>
  </div>
);