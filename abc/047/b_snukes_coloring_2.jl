parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    w, h, n = parseints()
    rect = falses(w, h)
    for i in 1:n
        x, y, a = parseints()
        if a == 1
            rect[1:x, :] .= true
        elseif a == 2
            rect[x+1:end, :] .= true
        elseif a == 3
            rect[:, 1:y] .= true
        else
            rect[:, y+1:end] .= true
        end
    end
    res = 0
    for i in 1:w
        for j in 1:h
            !rect[i, j] && (res += 1)
        end
    end
    println(res)
end

main()
