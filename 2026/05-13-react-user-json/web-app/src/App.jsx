import usersData from '../../users.json';

function Table() {
  return (
    <table border="1" cellPadding="5" cellSpacing="0">
      <thead>
        <tr>
          <th>Username</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Address</th>
        </tr>
      </thead>
      <tbody>
        {usersData.map((user) => (
          <tr key={user.id}>
            <td>{user.username}</td>
            <td>{user.email}</td>
            <td>{user.phone}</td>
            <td>{user.address}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default function App() {
  return (
    <div>
      <h1>ユーザーダッシュボード</h1>
      <p>ここにRubyで作ったデータを表示します</p>
      <p>読み込んだユーザー数: {usersData.length}人</p>
      <Table />
    </div>
  );
}
