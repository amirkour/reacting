# reacting

Top level folder for the reacting "solution" which inlucdes various web and aws projects.

There's a package.json in this folder, but it's just for running scripts to automate some stuff - there's no actual code living here because it's just a [meta](https://www.npmjs.com/package/meta) repo.

# Tic Tac Toe

The package.json has various scripts for building and deploying the tic tac toe lambda handler to AWS ☁️

*hint* it's a docker image! 🐳

The package.json scripts assume there's a `.env` file in this folder with necessary environment variables - see package.json scripts to learn which you'll need 👈🏼 many of the scripts won't work w/o the proper environment vars!