<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BlogSystem.WebForm1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <title>仪表盘</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/antd/4.16.13/antd.min.css" rel="stylesheet" />
    <script src="https://cdn.bootcdn.net/ajax/libs/react/17.0.2/umd/react.production.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/react-dom/17.0.2/umd/react-dom.production.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/babel-standalone/7.15.7/babel.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/antd/4.16.13/antd.min.js"></script>
    <style>
        .content {
            padding: 24px;
            background: #fff;
        }
        .site-card-wrapper {
            margin-bottom: 24px;
        }
        .ant-card-body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100px;
            font-size: 24px;
        }
        .quick-access {
            display: flex;
            flex-wrap: wrap;
        }
        .quick-access .ant-col {
            margin-bottom: 24px;
        }
        .empty-message {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="root"></div>
    </form>
    <script type="text/babel">
        const { Layout, Menu, Card, Col, Row, Button } = antd;
        const { Header, Content, Footer, Sider } = Layout;

        function Dashboard() {
            return (
                <Layout style={{ minHeight: '100vh' }}>
                    <Sider collapsible>
                        <div className="logo" style={{ height: '32px', margin: '16px', background: 'rgba(255, 255, 255, 0.3)' }} />
                        <Menu theme="dark" defaultSelectedKeys={['1']} mode="inline">
                            <Menu.Item key="1">仪表盘</Menu.Item>
                            <Menu.SubMenu key="sub1" title="内容">
                                <Menu.Item key="2">文章</Menu.Item>
                                <Menu.Item key="3">页面</Menu.Item>
                                <Menu.Item key="4">评论</Menu.Item>
                                <Menu.Item key="5">附件</Menu.Item>
                            </Menu.SubMenu>
                            <Menu.Item key="6">外观</Menu.Item>
                            <Menu.Item key="7">系统</Menu.Item>
                        </Menu>
                    </Sider>
                    <Layout className="site-layout">
                        <Header className="site-layout-background" style={{ padding: 0, background: '#fff' }} />
                        <Content style={{ margin: '0 16px' }}>
                            <div className="site-card-wrapper">
                                <Row gutter={16}>
                                    <Col span={6}>
                                        <Card title="文章" bordered={false}>3</Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="用户" bordered={false}>1</Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="评论" bordered={false}>0</Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="浏览量" bordered={false}>40</Card>
                                    </Col>
                                </Row>
                            </div>
                            <div className="quick-access">
                                <Row gutter={16}>
                                    <Col span={6}>
                                        <Card title="个人中心" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="查看站点" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="创建文章" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="创建页面" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="附件上传" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="主题管理" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="插件管理" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="新建用户" bordered={false}></Card>
                                    </Col>
                                    <Col span={6}>
                                        <Card title="刷新搜索引擎" bordered={false}></Card>
                                    </Col>
                                </Row>
                            </div>
                            <div className="site-card-wrapper">
                                <Card title="通知" bordered={false}>
                                    <div className="empty-message">
                                        <p>当前没有未读的消息</p>
                                        <Button type="primary">刷新</Button>
                                    </div>
                                </Card>
                            </div>
                        </Content>
                        <Footer style={{ textAlign: 'center' }}>Powered by Halo Pro</Footer>
                    </Layout>
                </Layout>
            );
        }

        ReactDOM.render(<Dashboard />, document.getElementById('root'));
    </script>
</body>
</html>

