# 47. Write three messages

with open("event_log.txt", "w") as file:
    file.write("Event registration started.\n")
    file.write("Booking amounts calculated.\n")
    file.write("Registration data processed.\n")


# 48. Append two messages

with open("event_log.txt", "a") as file:
    file.write("Confirmed registrations processed.\n")
    file.write("Event report generated.\n")


# 49. Read the complete file

with open("event_log.txt", "r") as file:
    content = file.read()
    print(content)


# 50–52. Read line by line without extra blank lines

with open("event_log.txt", "r") as file:
    for line in file:
        print(line, end="")
