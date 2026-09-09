
#!/bin/bash

age=20

(( age >= 18 )) && status="Adult" || status="Minor"
echo $status

# condition && command_if_true || command_if_false
echo "$(( age >= 18))"
echo "$(( age >= 89))"

# true && echo "good" || echo "bad"