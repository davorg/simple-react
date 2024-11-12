import React, { useState, useEffect } from 'react';

function App() {
    const [items, setItems] = useState([]);
    const [loading, setLoading] = useState(true);

    // Fetch data from the Dancer2 API
    useEffect(() => {
        fetch('http://localhost:5000/api/items')
            .then(response => response.json())
            .then(data => {
                setItems(data);
                setLoading(false);
            })
            .catch(error => {
                console.error("Error fetching data:", error);
                setLoading(false);
            });
    }, []);

    return (
        <div>
            <h1>Item List</h1>
            {loading ? (
                <p>Loading...</p>
            ) : (
                <ul>
                    {items.map(item => (
                        <li key={item.id}>{item.name}</li>
                    ))}
                </ul>
            )}
        </div>
    );
}

export default App;

