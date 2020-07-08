/*checks for incorrect email input */
Create Trigger email_check BEFORE UPDATE ON employees
  FOR EACH ROW
  BEGIN
    IF new.email NOT LIKE %@% THEN
      SET new.amount = NULL;
    ELSE new.email = new.email;
    END IF;
  END;

