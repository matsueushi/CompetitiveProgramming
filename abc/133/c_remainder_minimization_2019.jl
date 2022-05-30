parseints() = parse.(Int, split(readline()))

function main()
    l, r = parseints()
    r = min(r, l + 2019)
    res = typemax(Int)
    for i in l:r-1
        for j in i+1:r
            res = min(res, i * j % 2019)
        end
    end
    println(res)
end

main()
