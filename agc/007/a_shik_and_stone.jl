parseints() = parse.(Int, split(readline()))

function solve(h, w, as)
    for i in 1:h
        for j in 1:w
            as[i][j] == '#' || continue
            if !(i == 1 && j == 1)
                ul = 0
                if i != 1 && as[i-1][j] == '#'
                    ul += 1
                end
                if j != 1 && as[i][j-1] == '#'
                    ul += 1
                end
                ul == 1 || return false
            end
            if !(i == h && j == w)
                dr = 0
                if i != h && as[i+1][j] == '#'
                    dr += 1
                end
                if j != w && as[i][j+1] == '#'
                    dr += 1
                end
                dr == 1 || return false
            end
        end
    end
    true
end

function main()
    h, w = parseints()
    as = Vector{String}(undef, h)
    for i in 1:h
        as[i] = readline()
    end
    println(ifelse(solve(h, w, as), "Possible", "Impossible"))
end

main()
