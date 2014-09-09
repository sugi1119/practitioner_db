# Practitioner management database

This is a small application for a practitioner.

## Development phase:
> Completed:
>> 1. Create a simple data flow from from Appointment/ Consultation/Prescription/ Supplement/ Invoice.
>In future:
>>  2. Create data flow between Service menu and Invoice / also Prescription and Supplement with multiple data.
>>  3. Create data flow between Consultation and Health History Questionaries.
>>  4. Add Authorization feature for post
>>  5. Add search function

## System requirement/ in-use:

> * Ruby version: Ruby 2.0

> * Rails version: Rails 4.1.2

> * GEM: HAML, Bootstrap

> * Database creation: PostgreSQL

## Functions:
> * Sign up/ log in: Users(practitioners) must sign up or log in first, otherwise, they cannot access any database. Only admin has access to practitioners' information.
> * Appointment: This can be booked between Mon-Fri/ 09:00-16:00. Each consultation period require 1 hour.
> * Supplement: This is as a supplement stock list.  This would be expand to order management function.
> * Invoice must have one consultation and may have one or none prescription.



