using DataStructures

function main()
    sd = SortedDict{Int,Int}()
    q = parse(Int, readline())
    for i in 1:q
        input = parse.(Int, split(readline()))
        if input[1] == 1
            sd[input[2]] = get(sd, input[2], 0) + 1
        elseif input[1] == 2
            x = input[2]
            k = input[3]
            tok = searchsortedlast(sd, x)
            while tok != beforestartsemitoken(sd) && k > 0
                x, v = deref((sd, tok))
                k -= v
                tok = regress((sd, tok))
            end
            if k > 0
                println(-1)
            else
                println(x)
            end
        else
            x = input[2]
            k = input[3]
            tok = searchsortedfirst(sd, x)
            while tok != pastendsemitoken(sd) && k > 0
                x, v = deref((sd, tok))
                k -= v
                tok = advance((sd, tok))
            end
            if k > 0
                println(-1)
            else
                println(x)
            end
        end
    end
end

main()
