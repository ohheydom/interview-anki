# Interview Anki

Interview Anki helps developers practice programming interview questions using the Anki spaced repetition system

### Database Initialization

### Running

You'll first need an API key from HackerRank, which you can retrieve here: [https://www.hackerrank.com/api/docs](https://www.hackerrank.com/api/docs).

Set your environment variable HACKERRANK\_KEY equal to your key.

### Todo

[] Change challenge url to contain slug, not id
[] Create all model associations
  * UserChallenge has many attempts
  * Attempt belongs to UserChallenges, contains code field, user_challenge_id
[] Fix model dependencies
  * Deleting a challenge deletes appropriate attempts
  * Deleting a UserChallenge deletes attempts
[] Non logged-in Home
  * Explain what Interview Anki is
[] User Home
  * Lists the five or so algorithms you should complete today
[] Challenge Index
  * Display all challenges, dimming ones that are already added to your challenge list
  * Enable adding Challenge to UserChallenge table
[] Challenge Show
  * Links to past attempts
  * Interacts with HackerRank api to upload code and test
[] Run Rails Best Practices

### Ideas

Attempts
  belongs_to :user_challenges
  code: string
