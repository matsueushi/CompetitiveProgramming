parseints() = parse.(Int, split(readline()))

function solve(h, w, k, ss)
    cts = zeros(Int, h)
    for i in 1:h
        cts[i] = count(==('#'), ss[i])
    end

    res = zeros(Int, h, w)
    pn = 1
    for i in 1:h
        cts[i] == 0 && continue
        sts = 0
        for j in 1:w
            res[i, j] = pn
            if ss[i][j] == '#'
                sts += 1
                sts == cts[i] && continue
                pn += 1
            end
        end
        pn += 1
    end

    c = 0
    for i in 1:h
        if cts[i] != 0
            c = i
        elseif c > 0
            res[i, :] = res[c, :]
        end
    end

    c = 0
    for i in h:-1:1
        if cts[i] != 0
            c = i
        elseif c > 0
            res[i, :] = res[c, :]
        end
    end

    res
end


function main()
    h, w, k = parseints()
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    res = solve(h, w, k, ss)
    for i in 1:h
        println(join(res[i, :], " "))
    end
end

main()
