function main()
    n, q = parse.(Int, split(readline()))
    prev = zeros(Int, n)
    next = zeros(Int, n)
    for i in 1:q
        input = parse.(Int, split(readline()))
        t = first(input)
        x = input[2]
        if t == 1
            y = input[3]
            next[y] = x
            prev[x] = y
        elseif t == 2
            y = input[3]
            next[y] = 0
            prev[x] = 0
        else
            z = x
            while next[z] != 0
                z = next[z]
            end
            ts = [z]
            while prev[z] != 0
                z = prev[z]
                push!(ts, z)
            end
            print(length(ts))
            print(" ")
            println(join(ts, " "))
        end
    end
end

main()
