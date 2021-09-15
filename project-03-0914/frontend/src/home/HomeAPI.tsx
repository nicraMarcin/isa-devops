import Api from "../Api";


export const useDataServiceApi = () => {

    const getTodos = async () => {
        return await Api.get(
        "/todos"
        )
    };

    const addTodo = async (text: string) => {
        return await Api.post(
            "/todos",
            {
                text: text
            },
        )
    };

    return [getTodos];
}
