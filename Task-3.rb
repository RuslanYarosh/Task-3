def count_friends(matrix,n,s)
    queue = [s]
    used = []
    friends = []
    1.upto(n) { used.push false }
    used[s-1] = true
    while !(queue.empty?) do
      person = queue.shift
      person_row = matrix[person - 1]
      1.upto(person_row.length) do |new_person|
        if person_row[new_person - 1] == 1
          unless used[new_person - 1]
            used[new_person - 1] = true
            queue.push(new_person)
          end
        end
      end
    end

    used.each_with_index do |person, index|
      if person
        friends.push(index + 1)
      end
    end

    friends.length - 1
end

count_friends([[0,0,0,0,0],[0,0,1,0,0],[0,1,0,0,1],[0,0,0,0,1],[0,0,1,1,0]], 5, 2)
