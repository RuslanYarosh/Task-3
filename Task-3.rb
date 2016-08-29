def count_friends(matrix,n,s)
    queue = [s]  #an array of person number
    used = []
    friends = []
    1.upto(n) { used.push false } #fill an array which will be responsible for the person we have already considered or not. "false"-not considered man
    used[s-1] = true  # for the person we are looking for friends is assigned a value "true"
    while !(queue.empty?) do  # if the queue is not empty
      person = queue.shift  # pushes the first man from the queue ("the first came in, first-out"), transferring it to a variable.
      person_row = matrix[person - 1]  # pull out a row of human friends
      1.upto(n) do |new_person|  # We take each person оf row
        if person_row[new_person - 1] == 1  # if the expression is "true", do next
          unless used[new_person - 1]  # Check we take this person or nott . If the value "false", do next
            used[new_person - 1] = true  # assigns a value to a friend - "true"
            queue.push(new_person)  # add to the queue a new friend
          end
        end
      end
    end

    used.each_with_index do |person, index|
      if person                   # if person = true, do next
        friends.push(index + 1)   # count all "true"
      end
    end

    friends.length - 1 # does not consider himself
end



count_friends([[0,0,0,0,0],[0,0,1,0,0],[0,1,0,0,1],[0,0,0,0,1],[0,0,1,1,0]], 5, 2)
#count_friends([[0,1,0],[1,0,1],[0,1,0]], 3, 1)
