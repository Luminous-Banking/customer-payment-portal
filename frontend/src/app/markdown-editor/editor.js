/*
Create a basic markdown editor in node.js with the following features:
- Create state for markdown with default text "type markdown here"
- A text area where users can write markdown
- Show a live preview of the markdown text as I type
- Support for basic markdown syntax like headers, bold, italics
- Use React markdown npm package
- The markdown text and resulting HTML should be saved in the component's state and updated in real time
*/

import React, { useState } from 'react';
import ReactMarkdown from 'react-markdown';

const MarkdownEditor = () => {
  // Create state for markdown with default text
  const [markdown, setMarkdown] = useState("Type markdown here");

  // Handle changes in the text area
  const handleChange = (event) => {
    setMarkdown(event.target.value);
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '20px', padding: '20px' }}>
      {/* Text area for writing markdown */}
      <textarea
        value={markdown}
        onChange={handleChange}
        style={{ width: '100%', height: '200px', fontSize: '16px', padding: '10px' }}
      />

      {/* Live preview of markdown */}
      <div style={{ border: '1px solid #ccc', padding: '10px', borderRadius: '5px' }}>
        <ReactMarkdown>{markdown}</ReactMarkdown>
      </div>
    </div>
  );
};

export default MarkdownEditor;
