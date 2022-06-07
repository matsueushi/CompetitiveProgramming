parseints() = parse.(Int, split(readline()))
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

function solve(h, w, ss)
    hss = Vector{Int}[]
    for i in 1:h
        hs = Int[]
        c = '%'
        t = 1
        for j in 1:w
            if ss[i][j] == c
                t += 1
            else
                c = ss[i][j]
                if j != 1
                    push!(hs, t)
                end
                t = 1
            end

            j == w && (push!(hs, t))
        end
        push!(hss, hs)
    end
    chss = cumsum.(hss)

    wss = Vector{Int}[]
    for j in 1:w
        ws = Int[]
        c = '%'
        t = 1
        for i in 1:h
            if ss[i][j] == c
                t += 1
            else
                c = ss[i][j]
                if i != 1
                    push!(ws, t)
                end
                t = 1
            end

            i == h && push!(ws, t)
        end
        push!(wss, ws)
    end
    cwss = cumsum.(wss)

    res = 0
    for i in 1:h
        for j in 1:w
            ss[i][j] == '#' && continue
            ix = searchsortedfirst(chss[i], j)
            iy = searchsortedfirst(cwss[j], i)
            res = max(res, hss[i][ix] + wss[j][iy] - 1)
        end
    end
    res
end

function main()
    h, w = parseints()
    ss = parsestrings(h)
    println(solve(h, w, ss))
end

main()
