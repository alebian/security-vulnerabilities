User.create(email: 'tincho@wolox.com.ar',  password: 'tincho123')
User.create(email: 'jordi@wolox.com.ar',   password: 'jordi1234')
User.create(email: 'pablito@wolox.com.ar', password: 'He4rt5t0ne')
User.create(email: 'fede@wolox.com.ar',    password: 'waudnaskjd')
gabo = User.create(email: 'gabo@wolox.com.ar',    password: 'SKOLZZZZ')
ale = User.create(email: 'ale@wolox.com.ar',     password: 'P455W0Rd')
User.create(email: 'dinu@wolox.com.ar',    password: 'cowboy')
User.create(email: 'eri@wolox.com.ar',     password: 'computer')
User.create(email: 'dani@wolox.com.ar',    password: 'riverplate')

Post.create(user: gabo, title: 'giladita', body: 'gilada gilada')
Post.create(user: ale, title: 'adivinen que', body: 'soy re careta')
Post.create(user: ale, title: 'XSS', body: '<script>alert("This is an XSS example");</script>')
