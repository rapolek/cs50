-- -- Keep a log of any SQL queries you execute as you solve the mystery.

-- -- 1. FIND OUT WHO THE THIEF IS:

-- -- Find out the description of the crime
-- SELECT description
-- FROM crime_scene_reports
-- WHERE year = 2020
-- AND month = 7
-- AND day = 28
-- AND street = 'Chamberlin Street';

-- -- Get the witnesses' names & interview transcripts
-- SELECT transcript
-- FROM interviews
-- WHERE year = 2020
-- AND month = 7
-- AND day = 28
-- AND transcript
-- LIKE '%courthouse%';

-- -- Find the first list of suspects
-- CREATE VIEW [Suspects1] AS
-- SELECT name
-- FROM people
-- JOIN courthouse_security_logs
-- ON people.license_plate = courthouse_security_logs.license_plate
-- WHERE year = 2020
-- AND month = 7
-- AND day = 28
-- AND hour = 10
-- AND minute BETWEEN 15 AND 25
-- AND activity = 'exit';

-- -- Find the second list of suspects
-- CREATE VIEW [Suspects2] AS
-- SELECT name
-- FROM people
-- JOIN bank_accounts, atm_transactions
-- ON people.id = bank_accounts.person_id
-- AND bank_accounts.account_number = atm_transactions.account_number
-- WHERE year = 2020
-- AND month = 7
-- AND day = 28
-- AND atm_location = 'Fifer Street'
-- AND transaction_type = 'withdraw';

-- -- Find the third list of suspects
-- CREATE VIEW [Suspects3] AS
-- SELECT name
-- FROM people
-- JOIN phone_calls
-- ON people.phone_number = phone_calls.caller
-- WHERE year = 2020
-- AND month = 7
-- AND day = 28
-- AND duration < 60;

-- -- Find the fourth list of suspects
-- CREATE VIEW [Suspects4] AS
-- SELECT name
-- FROM people
-- JOIN passengers
-- ON people.passport_number = passengers.passport_number
-- WHERE flight_id = (SELECT id
--     FROM flights
--     WHERE year = 2020
--     AND month = 7
--     AND day = 29
--     AND hour = (SELECT MIN(hour)
--         FROM flights
--         WHERE year = 2020
--         AND month = 7
--         AND day = 29));

-- -- Narrow down the list of subjects
-- CREATE VIEW [Narrow1] AS
-- SELECT [Suspects1].name
-- FROM [Suspects1]
-- INNER JOIN [Suspects2]
-- ON [Suspects1].name = [Suspects2].name;

-- CREATE VIEW [Narrow2] AS
-- SELECT [Suspects3].name
-- FROM [Suspects3]
-- INNER JOIN [Suspects4]
-- ON [Suspects3].name = [Suspects4].name;

-- -- Find out who the thief is!
-- CREATE VIEW [Narrow3] AS
-- SELECT [Narrow1].name
-- FROM [Narrow1]
-- INNER JOIN [Narrow2]
-- ON [Narrow1].name = [Narrow2].name;
-- returns 'Ernest'

-- -- Delete views
-- DROP VIEW [Suspects1];
-- DROP VIEW [Suspects2];
-- DROP VIEW [Suspects3];
-- DROP VIEW [Suspects4];
-- DROP VIEW [Narrow1];
-- DROP VIEW [Narrow2];
-- DROP VIEW [Narrow3];

-- -- 2. FIND OUT WHAT CITY THE THIEF ESCAPED TO:

-- SELECT city
-- FROM airports
-- WHERE airports.id = (SELECT destination_airport_id
--     FROM flights
--     WHERE flights.id = (SELECT id
--         FROM flights
--         WHERE year = 2020
--         AND month = 7
--         AND day = 29
--         AND hour = (SELECT MIN(hour)
--             FROM flights
--             WHERE year = 2020
--             AND month = 7
--             AND day = 29)));
-- -- returns 'London'

-- -- 3. FIND OUT WHO IS THE THIEF'S ACCOMPLICE:

-- SELECT name
-- FROM people
-- WHERE phone_number = (SELECT receiver
--     FROM phone_calls
--     WHERE year = 2020
--     AND month = 7
--     AND day = 28
--     AND duration < 60
--     AND caller = (SELECT phone_number
--         FROM people
--         WHERE name = 'Ernest'));
-- -- returns 'Berthold'