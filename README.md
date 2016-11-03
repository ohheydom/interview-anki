# Interview Anki

Interview Anki helps developers practice programming interview questions using the Anki spaced repetition system

### Database Initialization

### Running

### Todo

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
  * If not part of your list, you must add first before attempting
  * Enable adding Challenge to UserChallenge table
  * Enable removing challenge from UserChallenge table, removing all attempts
  * Links to past attempts
  * Interacts with HackerRank api to upload code and test

### Ideas

Attempts
  belongs_to :user_challenges
  code: string
