SELECT trigger_name, event_object_table, action_timing, action_orientation, action_statement
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE event_object_table = 'titanic';