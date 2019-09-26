import React from 'react';
import logo from './logo.png';
import './App.css';

function App() {
    return (
        <div className='App'>
            <header className='App-header'>
                <img src={logo} className='App-logo' alt='logo' />
                <p>GITHUB Auto Deploy Action</p>
                <span>Automate your workflow from idea to production</span>
                <a
                    className='App-link'
                    href='https://github.com/features/actions'
                    target='_blank'
                    rel='noopener noreferrer'
                >
                    Learn GitHubAcitons
                </a>
            </header>
        </div>
    );
}

export default App;
