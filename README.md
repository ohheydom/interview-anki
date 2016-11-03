# Interview Anki

Interview Anki helps developers practice programming interview questions using the Anki spaced repetition system

### Database Initialization

### Running

### Todo

[] Create all model associations
  * User has many challenges through user_challenges
  * Challenge has many Users through user_challenges
  * UserChallenge belongs to User and Challenge
  * UserChallenge has many attempts
  * Attempt belongs to UserChallenges, contains code field, user_challenge_id
[] Fix Model validations
  * Challenge slug must be unique
  * UserChallenge user_id and challenge_id must be valid
  * Attempt user_challenge_id must be valid
[] Fix model dependencies
  * Deleting a challenge deletes appropriate UserChallenge and Attemp rows
  * Deleting a UserChallenge deletes attempts
[] Non logged-in Home
  * Explain what Interview Anki is
[] User Home
  * Button to create a new challenge
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
[] Challenge New/Create
  * Create a new challenge including description, boilerplate, and test cases
[] Edit Challenge
  * If not user that created challenge, bring back to homepage

### Ideas

Attempts
  belongs_to :user_challenges
  code: string
