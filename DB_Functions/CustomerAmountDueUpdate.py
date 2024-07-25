import sqlite3

#Connect to LM DB
conn = sqlite3.connect("../LM.db")
cursor = conn.cursor()

#Update amount each user owes based on services they have active
cursor.execute("""
UPDATE Clients
SET amount_due = (
    SELECT COALESCE(SUM(price), 0)
    FROM Services
    WHERE Services.user_id = Clients.id AND Services.is_active = True
)
"""
)
#Save changes made by update
conn.commit()
#Close connection to LM DB
conn.close()
