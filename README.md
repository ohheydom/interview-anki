# Interview Anki

Interview Anki helps developers practice programming interview questions using the Anki spaced repetition system.

### Database Initialization

SQLite database is setup already so no need to run migrations.

### Running

You'll first need an API key from HackerRank, which you can retrieve here: [https://www.hackerrank.com/api/docs](https://www.hackerrank.com/api/docs).

Set the environment variable HACKERRANK\_KEY equal to your API key.

Then run the webserver:

```
rails server
```

### Todo

[] Change challenge url to contain slug, not id
[] Create all model associations
  * UserChallenge has many Attempts
  * Attempt belongs to UserChallenges, contains code field, user\_challenge\_id
[] Fix model dependencies
  * Deleting a challenge deletes appropriate Attempts and UserChallenges
  * Deleting a UserChallenge deletes Attempts
[] Challenge Index
  * Display all challenges, dimming ones that are already added to your challenge list
  * Enable adding Challenge to User's Deck
[] Challenge Show
  * Links to past attempts
