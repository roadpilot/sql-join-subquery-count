/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Tables:
Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level

Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge.

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.
having submissions.score>=difficulty.score
select hackers.hacker_id,name,submissions.score,difficulty.score from hackers 
*/

select hackers.hacker_id,name from hackers 
inner join submissions on hackers.hacker_id=submissions.hacker_id 
inner join challenges on submissions.challenge_id=challenges.challenge_id 
inner join difficulty on challenges.challenge_id=submissions.challenge_id
where submissions.score = difficulty.score and challenges.difficulty_level = difficulty.difficulty_level
group by hackers.hacker_id,name
having count(hackers.hacker_id)>1
order by count(hackers.hacker_id) desc, hackers.hacker_id
